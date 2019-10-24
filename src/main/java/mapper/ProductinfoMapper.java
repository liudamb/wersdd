package mapper;

import entity.Productinfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductinfoMapper {
    int deleteByPrimaryKey(Integer pId);

    int insert(Productinfo record);

    int insertSelective(Productinfo record);

    Productinfo selectByPrimaryKey(Integer pId);
    List<Productinfo> selectpType();
    List<Productinfo> selectBrandByPtype(String ptype);
    List<Productinfo> selectSaleProducts();
    List<Productinfo> selectProductsBypTypeAndBrand(@Param(value="pType")String pType, @Param(value="brand")String brand);

    int updateByPrimaryKeySelective(Productinfo record);

    int updateByPrimaryKey(Productinfo record);
}