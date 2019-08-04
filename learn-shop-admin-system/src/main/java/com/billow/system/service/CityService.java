package com.billow.system.service;

import com.billow.system.pojo.vo.CityVo;

import java.util.List;

/**
 * @author liuyongtao
 * @create 2019-08-04 13:49
 */
public interface CityService {

    /**
     * 查询省市区
     *
     * @param parentCityId
     * @return java.util.List<com.billow.system.pojo.vo.CityVo>
     * @author billow
     * @date 2019/8/4 13:51
     */
    List<CityVo> findCityByParentCityId(String parentCityId);
}
