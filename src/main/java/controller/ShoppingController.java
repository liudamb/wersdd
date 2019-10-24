package controller;

import entity.Productinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import serviceimpl.ProductinfoServiceImpl;

import java.util.List;

@RestController
public class ShoppingController {
    @Autowired
    ProductinfoServiceImpl psi;
    @RequestMapping("/getp_type")
    public List<Productinfo> getPtype(){

        return psi.selectpType();

}

    @RequestMapping("/getBrand")
    public List<Productinfo> getBrand(@RequestParam String ptype){

        return psi.selectBrandByPtype(ptype);

    }




    @RequestMapping("/getFirstShow")
    public List<Productinfo> getFirstShow(){

        return psi.selectSaleProducts();

    }


    @RequestMapping("/clickProducts")
    public List<Productinfo> clickProducts(@RequestParam String pType,@RequestParam String brand){

        return psi.selectProductsBypTypeAndBrand(pType,brand);
    }

    @RequestMapping("/getproductinfo")
    public Productinfo getproductinfo(@RequestParam Integer pId){

        return psi.selectByPrimaryKey(pId);
    }


}
