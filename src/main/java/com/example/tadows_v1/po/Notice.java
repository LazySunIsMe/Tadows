package com.example.tadows_v1.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author Lizhixian
 * @since 2024-06-14
 */
public class Notice implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 自增的公告id
     */
    @TableId(value = "notice_id", type = IdType.AUTO)
    private Integer noticeId;

    /**
     * 公告附带的图片的链接，可能是服务器相对路径或者图床
     */
    private String headerImageLink;

    /**
     * 公告标题
     */
    private String title;

    /**
     * 公告发布时间（精确到秒）
     */
    private LocalDateTime publishTime;

    /**
     * 公告的类型（通知或动态），0->通知；1->动态
     */
    private Integer type;

    /**
     * 公告的位置（0->下面,1->滚动条,2->横幅）
     */
    private Integer ifImportant;

    public Integer getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Integer noticeId) {
        this.noticeId = noticeId;
    }

    public String getHeaderImageLink() {
        return headerImageLink;
    }

    public void setHeaderImageLink(String headerImageLink) {
        this.headerImageLink = headerImageLink;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public LocalDateTime getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(LocalDateTime publishTime) {
        this.publishTime = publishTime;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getIfImportant() {
        return ifImportant;
    }

    public void setIfImportant(Integer ifImportant) {
        this.ifImportant = ifImportant;
    }

    @Override
    public String toString() {
        return "Notice{" +
        "noticeId = " + noticeId +
        ", headerImageLink = " + headerImageLink +
        ", title = " + title +
        ", publishTime = " + publishTime +
        ", type = " + type +
        ", ifImportant = " + ifImportant +
        "}";
    }
}
