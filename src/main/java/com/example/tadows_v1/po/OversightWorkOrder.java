package com.example.tadows_v1.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

/**
 * @author Lizhixian
 * @since 2024-06-14
 */
@TableName("oversight_work_order")
public class OversightWorkOrder implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 工单的自增id
     */
    @TableId(value = "work_order_id", type = IdType.AUTO)
    private Integer workOrderId;

    /**
     * 工单状态（0->已提交,1->已指派,2->已反馈,3->已取消）
     */
    private Integer state;

    /**
     * 负责此工单的管理员的工号（谁指派
     */
    private Integer managerWorkNumber;

    /**
     * 网格观察员的工号（指派给谁
     */
    private Integer gridWatcherNumber;

    /**
     * 网格观察员的回复
     */
    private String gridWatcherReply;

    /**
     * 是否加急（0,1）
     */
    private Integer ifExpedited;

    /**
     * 是否标记（0,1）
     */
    private Integer ifSigned;

    public Integer getWorkOrderId() {
        return workOrderId;
    }

    public void setWorkOrderId(Integer workOrderId) {
        this.workOrderId = workOrderId;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getManagerWorkNumber() {
        return managerWorkNumber;
    }

    public void setManagerWorkNumber(Integer managerWorkNumber) {
        this.managerWorkNumber = managerWorkNumber;
    }

    public Integer getGridWatcherNumber() {
        return gridWatcherNumber;
    }

    public void setGridWatcherNumber(Integer gridWatcherNumber) {
        this.gridWatcherNumber = gridWatcherNumber;
    }

    public String getGridWatcherReply() {
        return gridWatcherReply;
    }

    public void setGridWatcherReply(String gridWatcherReply) {
        this.gridWatcherReply = gridWatcherReply;
    }

    public Integer getIfExpedited() {
        return ifExpedited;
    }

    public void setIfExpedited(Integer ifExpedited) {
        this.ifExpedited = ifExpedited;
    }

    public Integer getIfSigned() {
        return ifSigned;
    }

    public void setIfSigned(Integer ifSigned) {
        this.ifSigned = ifSigned;
    }

    @Override
    public String toString() {
        return "OversightWorkOrder{" +
        "workOrderId = " + workOrderId +
        ", state = " + state +
        ", managerWorkNumber = " + managerWorkNumber +
        ", gridWatcherNumber = " + gridWatcherNumber +
        ", gridWatcherReply = " + gridWatcherReply +
        ", ifExpedited = " + ifExpedited +
        ", ifSigned = " + ifSigned +
        "}";
    }
}
