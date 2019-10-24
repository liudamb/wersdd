package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
public class ShopCarController {
     @Autowired
     JedisPool jedisPool;

    @RequestMapping("/addCar")
    public void addCar(@RequestParam String pid, @RequestParam String pNum, HttpServletRequest req){
         String username=req.getSession().getAttribute("user").toString();
         Jedis jedis=jedisPool.getResource();
         //购物车:使用redis的hmset数据结构,它是一个map
         //hmset的key是用户名,value还是一个map,这个map的
         //key是pid(商品唯一标识),value是购物车商品数量
         Map<String,String> map=jedis.hgetAll(username);
            if(map==null){
                map=new HashMap<String,String>();
                map.put(pid,pNum);
                jedis.hmset(username,map);

            }else{

                if(map.containsKey(pid)){
                    map.put(pid,String.valueOf(Integer.parseInt(map.get(pid))+1));
                    jedis.hmset(username,map);
                }else{
                    map.put(pid,pNum);
                    jedis.hmset(username,map);
                }
            }

    }





}
