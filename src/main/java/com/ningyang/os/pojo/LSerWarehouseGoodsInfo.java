package com.ningyang.os.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 商品入库记录日志
 * </p>
 *
 * @author kaider
 * @since 2018-11-26
 */
@TableName("l_ser_warehouse_goods_info")
public class LSerWarehouseGoodsInfo extends Model<LSerWarehouseGoodsInfo> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 入库来源（0：生产入库，1：换货入库，2：退货入库，3：换仓入库）
     */
    @TableField("source_type")
    private Integer SourceType;
    /**
     * 仓库id
     */
    @TableField("warehouse_id")
    private Long warehouseId;
    /**
     * 商品id
     */
    @TableField("goods_id")
    private Long goodsId;
    /**
     * 箱码
     */
    @TableField("box_no")
    private String boxNo;
    /**
     * 入库单号
     */
    @TableField("warehouse_in_no")
    private String warehouseInNo;
    /**
     * 操作人
     */
    @TableField("user_id")
    private Long userId;
    /**
     * 入库时间
     */
    @TableField("warehouse_in_time")
    private Date warehouseInTime;
    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;
    /**
     * 修改时间
     */
    @TableField("update_time")
    private Date updateTime;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getSourceType() {
        return SourceType;
    }

    public void setSourceType(Integer sourceType) {
        SourceType = sourceType;
    }

    public Long getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(Long warehouseId) {
        this.warehouseId = warehouseId;
    }

    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    public String getBoxNo() {
        return boxNo;
    }

    public void setBoxNo(String boxNo) {
        this.boxNo = boxNo;
    }

    public String getWarehouseInNo() {
        return warehouseInNo;
    }

    public void setWarehouseInNo(String warehouseInNo) {
        this.warehouseInNo = warehouseInNo;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Date getWarehouseInTime() {
        return warehouseInTime;
    }

    public void setWarehouseInTime(Date warehouseInTime) {
        this.warehouseInTime = warehouseInTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "LSerWarehouseGoodsInfo{" +
                "id=" + id +
                ", warehouseId=" + warehouseId +
                ", goodsId=" + goodsId +
                ", boxNo=" + boxNo +
                ", warehouseInNo=" + warehouseInNo +
                ", userId=" + userId +
                ", warehouseInTime=" + warehouseInTime +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                "}";
    }
}
