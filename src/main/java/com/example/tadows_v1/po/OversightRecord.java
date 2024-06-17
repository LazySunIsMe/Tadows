package com.example.tadows_v1.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author Lizhixian
 * @since 2024-06-14
 */
@TableName("oversight_record")
public class OversightRecord implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 监督记录的自增id
     */
    @TableId(value = "record_id", type = IdType.AUTO)
    private Integer recordId;

    /**
     * 监督员姓名
     */
    private String memberName;

    /**
     * 进行记录的地址（监督员所在地址）
     */
    private String address;

    /**
     * 监督记录的种类（0->监督请求；1->质询，怀疑测的不准）
     */
    private Integer type;

    /**
     * 记录发生的时间
     */
    private LocalDateTime occurrentTime;

    /**
     * 期望解决时间
     */
    private LocalDateTime expectResolutedTime;

    /**
     * 记录描述
     */
    private String description;

    /**
     * 是否紧急(0,1）
     */
    private Integer ifExpedited;

    /**
     * 记录对应的工单id
     */
    private Integer workOrderId;

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public LocalDateTime getOccurrentTime() {
        return occurrentTime;
    }

    public void setOccurrentTime(LocalDateTime occurrentTime) {
        this.occurrentTime = occurrentTime;
    }

    public LocalDateTime getExpectResolutedTime() {
        return expectResolutedTime;
    }

    public void setExpectResolutedTime(LocalDateTime expectResolutedTime) {
        this.expectResolutedTime = expectResolutedTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getIfExpedited() {
        return ifExpedited;
    }

    public void setIfExpedited(Integer ifExpedited) {
        this.ifExpedited = ifExpedited;
    }

    public Integer getWorkOrderId() {
        return workOrderId;
    }

    public void setWorkOrderId(Integer workOrderId) {
        this.workOrderId = workOrderId;
    }

    @Override
    public String toString() {
        return "OversightRecord{" +
        "recordId = " + recordId +
        ", memberName = " + memberName +
        ", address = " + address +
        ", type = " + type +
        ", occurrentTime = " + occurrentTime +
        ", expectResolutedTime = " + expectResolutedTime +
        ", description = " + description +
        ", ifExpedited = " + ifExpedited +
        ", workOrderId = " + workOrderId +
        "}";
    }
}
