package com.ningyang.os.action.output.dto.web;

import lombok.Data;

/**
 * @Author： kaider
 * @Date：2018/10/18 11:37
 * @描述：上传文件的信息
 */
@Data
public class FileUploadDto {

    private Long id;

    private String name;

    private String url;

    private String status;

    private Long uid;
}
