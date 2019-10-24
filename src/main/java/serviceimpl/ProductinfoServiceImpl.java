package serviceimpl;

import entity.Productinfo;
import mapper.ProductinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.ProductinfoService;
import java.util.List;

@Service
public class ProductinfoServiceImpl implements ProductinfoService {
    @Autowired
    ProductinfoMapper pm;

    @Override
    public int deleteByPrimaryKey(Integer pId) {
        return pm.deleteByPrimaryKey(pId);
    }

    @Override
    public int insert(Productinfo record) {
        return pm.insert(record);
    }

    @Override
    public int insertSelective(Productinfo record) {
        return pm.insertSelective(record);
    }

    @Override
    public Productinfo selectByPrimaryKey(Integer pId) {
        return pm.selectByPrimaryKey(pId);
    }

    @Override
    public List<Productinfo> selectpType() {
        return pm.selectpType();
    }

    @Override
    public List<Productinfo> selectBrandByPtype(String ptype) {
        return pm.selectBrandByPtype(ptype);
    }

    @Override
    public List<Productinfo> selectSaleProducts() {
        return pm.selectSaleProducts();
    }

    @Override
    public List<Productinfo> selectProductsBypTypeAndBrand(String pType, String brand) {
        return pm.selectProductsBypTypeAndBrand(pType,brand);
    }

    @Override
    public int updateByPrimaryKeySelective(Productinfo record) {
        return pm.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Productinfo record) {
        return pm.updateByPrimaryKey(record);
    }
}
