package serviceimpl;

import entity.Userinfo;
import mapper.UserinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserinfoService;

@Service
public class UserinfoServiceImpl implements UserinfoService {
    @Autowired
    UserinfoMapper um;


    @Override
    public int deleteByPrimaryKey(Integer uId) {
        return um.deleteByPrimaryKey(uId);
    }

    @Override
    public int insert(Userinfo record) {
        return um.insert(record);
    }

    @Override
    public int insertSelective(Userinfo record) {
        return um.insertSelective(record);
    }

    @Override
    public Userinfo selectByPrimaryKey(Integer uId) {
        return um.selectByPrimaryKey(uId);
    }

    @Override
    public Userinfo selectByUsername(String username) {
        return um.selectByUsername(username);
    }

    @Override
    public int updateByPrimaryKeySelective(Userinfo record) {
        return um.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Userinfo record) {
        return um.updateByPrimaryKey(record);
    }
}
