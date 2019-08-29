import requestUtils from '../../utils/requestUtils'
const baseUrl = 'admin-system/actDeployApi';

/**
 * 根据条件查询流程部署信息
 * @param procDeployFilter
 * @returns {*|AxiosPromise}
 * @constructor
 */
export const LoadDataProcDeployList = procDeployFilter => requestUtils.post(baseUrl + '/findProcDeployList', Object.assign(procDeployFilter));

/**
 * 根据id删除流程部署信息
 * @param id
 * @returns {*|AxiosPromise}
 * @constructor
 */
export const DeleteProcDeployById = id => requestUtils.del(baseUrl + '/delProceDeployById/' + id);


/**
 * 根据id获取流程部署图片
 * @param id
 * @returns {*|AxiosPromise}
 * @constructor
 */
export const ViewDeployImgById = id => {
  return new Promise((resolve) => {
    resolve(baseUrl + '/viewDeployImgById/' + id);
  });
};

/**
 * 部署流程
 * @returns {*|AxiosPromise}
 * @constructor
 */
export const Deploy = () => {
  return new Promise((resolve) => {
    resolve(baseUrl + '/deploy/file');
  });
};
