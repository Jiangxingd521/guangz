package com.ningyang.os.action.input.command.web.base;

import com.ningyang.os.action.output.dto.web.FileUploadDto;
import lombok.Data;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/11/13 14:58
 * @描述：品牌
 */
@Data
public class BrandCommand {

    private Long brandId;

    private String brandName;

    private int brandSort;

    private String brandRemark;

    private int brandState;

    private List<FileUploadDto> logoFile;
}
