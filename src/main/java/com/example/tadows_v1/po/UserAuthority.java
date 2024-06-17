package com.example.tadows_v1.po;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

/**
 * @author Lizhixian
 * @since 2024-06-14
 */
@TableName("user_authority")
public class UserAuthority implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户权限的自增id
     */
    @TableId("authority_id")
    private Integer authorityId;

    /**
     * 权限名称
     */
    private String authorityName;

    /**
     * 前端资源路径
     */
    private String uri;

    /**
     * 权限是否启用（0->不启用，1->启用）
     */
    private Integer authorityStatus;

    public Integer getAuthorityId() {
        return authorityId;
    }

    public void setAuthorityId(Integer authorityId) {
        this.authorityId = authorityId;
    }

    public String getAuthorityName() {
        return authorityName;
    }

    public void setAuthorityName(String authorityName) {
        this.authorityName = authorityName;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public Integer getAuthorityStatus() {
        return authorityStatus;
    }

    public void setAuthorityStatus(Integer authorityStatus) {
        this.authorityStatus = authorityStatus;
    }

    @Override
    public String toString() {
        return "UserAuthority{" +
        "authorityId = " + authorityId +
        ", authorityName = " + authorityName +
        ", uri = " + uri +
        ", authorityStatus = " + authorityStatus +
        "}";
    }
}
