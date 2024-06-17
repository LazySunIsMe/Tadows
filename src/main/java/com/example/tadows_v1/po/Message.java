package com.example.tadows_v1.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.io.Serializable;

/**
 * @author Lizhixian
 * @since 2024-06-14
 */
public class Message implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 自增的消息id
     */
    @TableId(value = "message_id", type = IdType.AUTO)
    private Integer messageId;

    /**
     * 该消息对应的公告(notice)id（外键）
     */
    private Integer noticeId;

    /**
     * 该信息是公告中的第n条消息
     */
    private Integer order;

    /**
     * 消息的类型（0->文字,1->图片)，二者只能选其一
     */
    private Integer type;

    /**
     * 消息的文字内容
     */
    private String messageText;

    /**
     * 消息附带的图片链接
     */
    private String messageImageLink;

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public Integer getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Integer noticeId) {
        this.noticeId = noticeId;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getMessageText() {
        return messageText;
    }

    public void setMessageText(String messageText) {
        this.messageText = messageText;
    }

    public String getMessageImageLink() {
        return messageImageLink;
    }

    public void setMessageImageLink(String messageImageLink) {
        this.messageImageLink = messageImageLink;
    }

    @Override
    public String toString() {
        return "Message{" +
        "messageId = " + messageId +
        ", noticeId = " + noticeId +
        ", order = " + order +
        ", type = " + type +
        ", messageText = " + messageText +
        ", messageImageLink = " + messageImageLink +
        "}";
    }
}
