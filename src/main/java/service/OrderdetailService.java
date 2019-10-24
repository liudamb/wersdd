package service;

import entity.Orderdetail;

public interface OrderdetailService {
    int deleteByPrimaryKey(Integer odId);

    int insert(Orderdetail record);

    int insertSelective(Orderdetail record);

    Orderdetail selectByPrimaryKey(Integer odId);

    int updateByPrimaryKeySelective(Orderdetail record);

    int updateByPrimaryKey(Orderdetail record);
}
