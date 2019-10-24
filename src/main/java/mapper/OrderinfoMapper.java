package mapper;

import entity.Orderinfo;

public interface OrderinfoMapper {
    int deleteByPrimaryKey(Integer oId);

    int insert(Orderinfo record);

    int insertSelective(Orderinfo record);

    Orderinfo selectByPrimaryKey(Integer oId);
    Orderinfo selectOidByPid(String pid);
    int updateByPrimaryKeySelective(Orderinfo record);

    int updateByPrimaryKey(Orderinfo record);
}