package com.example.web.service;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.web.dto.*;
import com.example.web.dto.query.*;
import com.example.web.entity.*;
import com.example.web.tools.dto.*;
import com.example.web.enums.*;
import java.lang.reflect.InvocationTargetException;
import org.springframework.web.bind.annotation.RequestParam;
import java.io.IOException;
import jakarta.servlet.http.HttpServletResponse;
/**
 * 封面功能的Service接口的定义清单
 */
public interface BannerService extends IService<Banner> {

    /**
     * 封面的分页查询方法接口定义
     */
    public PagedResult<BannerDto> List(BannerPagedInput input) ;
    /**
     * 封面的新增或者修改方法接口定义
     */
    public BannerDto CreateOrEdit(BannerDto input);

     /**
     * 获取封面信息
     */
    public BannerDto Get(BannerPagedInput input);
 	 /**
     * 封面删除
     */
    public void Delete(IdInput input);

    /**
     * 封面批量删除
     */
    public void BatchDelete(IdsInput input);
  

}
