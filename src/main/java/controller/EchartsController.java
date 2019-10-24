package controller;

import entity.WebInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import serviceimpl.WebInfoServiceImpl;

import java.util.List;

@RestController
public class EchartsController {
    @Autowired//注入WebInfoServiceImpl实现类
    WebInfoServiceImpl wsi;
    @RequestMapping("/getTimesAndTime")
    public List<WebInfo> selectAll(){
        return wsi.selectAll();
    }
}
