package top.fkxuexi.smk.modules.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/home")
public class HomeController {

    private static String prefix = "cms/";

    @RequestMapping(value = "/index")
    public String index(){
        return prefix + "home.html";
    }
}
