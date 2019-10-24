package serviceimpl;

import entity.Orderinfo;
import mapper.OrderinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.OrderinfoService;

@Service
public class OrderinfoServiceImpl implements OrderinfoService {
     @Autowired
    OrderinfoMapper om;
    @Override
    public int deleteByPrimaryKey(Integer oId) {
        return om.deleteByPrimaryKey(oId);
    }

    @Override
    public int insert(Orderinfo record) {
        return om.insert(record);
    }

    @Override
    public int insertSelective(Orderinfo record) {

        return om.insertSelective(record);
    }

    @Override
    public Orderinfo selectOidByPid(String pid) {
        return om.selectOidByPid(pid);
    }

    @Override
    public Orderinfo selectByPrimaryKey(Integer oId) {

        return om.selectByPrimaryKey(oId);
    }

    @Override
    public int updateByPrimaryKeySelective(Orderinfo record)
    {
        return om.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Orderinfo record) {
        return om.updateByPrimaryKey(record);
    }
}
