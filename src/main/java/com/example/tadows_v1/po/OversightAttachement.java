package com.example.tadows_v1.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

/**
 * @author Lizhixian
 * @since 2024-06-17
 */
@TableName("oversight_attachement")
public class OversightAttachement implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 记录监督附件的自增id
     */
    @TableId(value = "attachment_id", type = IdType.AUTO)
    private Integer attachmentId;

    /**
     * 对应记录的id（外键）
     */
    private Integer recordId;

    /**
     * 附件的路径或链接
     */
    private String attachmentLink;

    public Integer getAttachmentId() {
        return attachmentId;
    }

    public void setAttachmentId(Integer attachmentId) {
        this.attachmentId = attachmentId;
    }

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public String getAttachmentLink() {
        return attachmentLink;
    }

    public void setAttachmentLink(String attachmentLink) {
        this.attachmentLink = attachmentLink;
    }

    @Override
    public String toString() {
        return "OversightAttachement{" +
        "attachmentId = " + attachmentId +
        ", recordId = " + recordId +
        ", attachmentLink = " + attachmentLink +
        "}";
    }
}
