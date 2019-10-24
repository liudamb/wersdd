package service;

import entity.Productinfo;

import java.util.List;

public interface ProductinfoService {
    int deleteByPrimaryKey(Integer pId);

    int insert(Productinfo record);

    int insertSelective(Productinfo record);

    Productinfo selectByPrimaryKey(Integer pId);
    List<Productinfo> selectpType();
    List<Productinfo> selectBrandByPtype(String ptype);
    List<Productinfo> selectSaleProducts();
    List<Productinfo> selectProductsBypTypeAndBrand(String pType,String brand);

    int updateByPrimaryKeySelective(Productinfo record);

    int updateByPrimaryKey(Productinfo record);

}
