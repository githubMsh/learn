<#assign VO = table.entityName?substring(0,(table.entityName)?length-2) + "Vo">
<#assign Vo = (table.entityName?substring(0,(table.entityName)?length-2))?uncap_first + "Vo">
package ${package.Controller};

import com.billow.${package.ModuleName}.pojo.vo.${VO};
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import com.billow.${package.ModuleName}.service.${table.serviceName};
import com.billow.tools.utlis.ConvertUtils;
import com.billow.${package.ModuleName}.pojo.po.${entity};
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.baomidou.mybatisplus.core.metadata.IPage;
<#if restControllerStyle>
import org.springframework.web.bind.annotation.RestController;
<#else>
import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>

/**
 * <p>
 * ${table.comment!} 前端控制器
 * </p>
 *
 * @author ${author}
 * @since ${date}
 * @version v1.0
 */
<#if restControllerStyle>
@Api(tags = {"${table.comment!}"},value = "${table.comment!}")
@RestController
<#else>
@Controller
</#if>
@RequestMapping("<#if table.controllerName??>/${table.controllerName?uncap_first}</#if>")
<#if kotlin>
class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
<#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
<#else>
public class ${table.controllerName} {
</#if>

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private ${table.serviceName} ${table.serviceName?uncap_first};

    /**
    * 查询分页数据
    */
    @ApiOperation(value = "查询分页${table.comment!}数据")
    @RequestMapping(value = "/list")
    public IPage<${entity}> findListByPage(@RequestBody ${VO} ${Vo}){
        return ${table.serviceName?uncap_first}.findListByPage(${Vo});
    }


    /**
    * 根据id查询
    */
    @ApiOperation(value = "根据id查询${table.comment!}数据")
    @GetMapping(value = "/getById/{id}")
    public ${VO} getById(@PathVariable("id") String id){
        ${entity} po = ${table.serviceName?uncap_first}.getById(id);
        return ConvertUtils.convert(po, ${VO}.class);
    }

    /**
    * 新增
    */
    @ApiOperation(value = "新增${table.comment!}数据")
    @PostMapping(value = "/add")
    public ${VO} add(@RequestBody ${VO} ${Vo}){
        ${entity} po = ConvertUtils.convert(${Vo}, ${entity}.class);
        ${table.serviceName?uncap_first}.save(po);
        return ConvertUtils.convert(po, ${VO}.class);
    }

    /**
    * 删除
    */
    @ApiOperation(value = "删除${table.comment!}数据")
    @DeleteMapping(value = "/del/{id}")
    public String delete(@PathVariable("id") String id){
        ${table.serviceName?uncap_first}.removeById(id);
        return id;
    }

    /**
    * 修改
    */
    @ApiOperation(value = "更新${table.comment!}数据")
    @PutMapping(value = "/update")
    public ${VO} update(@RequestBody ${VO} ${Vo}){
        ${entity} po = ConvertUtils.convert(${Vo}, ${entity}.class);
        ${table.serviceName?uncap_first}.updateById(po);
        return ConvertUtils.convert(po, ${VO}.class);
    }
}
</#if>