package com.example.tadows_v1.po;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author Lizhixian
 * @since 2024-06-14
 */
@TableName("aqi_data")
public class AqiData implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 某地AQI的自增id
     */
    @TableId("aqi_id")
    private Integer aqiId;

    /**
     * 进行记录的网格员的工号
     */
    private Integer gridWatcherNumber;

    /**
     * 地址
     */
    private String address;

    /**
     * 记录时间
     */
    private LocalDateTime recordTime;

    /**
     * pm2.5含量
     */
    private Double pm2d5;

    /**
     * pm10含量
     */
    private Double pm10;

    /**
     * 二氧化硫含量
     */
    private Double so2;

    /**
     * 二氧化氮含量
     */
    private Double no2;

    /**
     * 臭氧含量
     */
    private Double o3;

    public Integer getAqiId() {
        return aqiId;
    }

    public void setAqiId(Integer aqiId) {
        this.aqiId = aqiId;
    }

    public Integer getGridWatcherNumber() {
        return gridWatcherNumber;
    }

    public void setGridWatcherNumber(Integer gridWatcherNumber) {
        this.gridWatcherNumber = gridWatcherNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public LocalDateTime getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(LocalDateTime recordTime) {
        this.recordTime = recordTime;
    }

    public Double getPm2d5() {
        return pm2d5;
    }

    public void setPm2d5(Double pm2d5) {
        this.pm2d5 = pm2d5;
    }

    public Double getPm10() {
        return pm10;
    }

    public void setPm10(Double pm10) {
        this.pm10 = pm10;
    }

    public Double getSo2() {
        return so2;
    }

    public void setSo2(Double so2) {
        this.so2 = so2;
    }

    public Double getNo2() {
        return no2;
    }

    public void setNo2(Double no2) {
        this.no2 = no2;
    }

    public Double geto3() {
        return o3;
    }

    public void seto3(Double o3) {
        this.o3 = o3;
    }

    @Override
    public String toString() {
        return "AqiData{" +
        "aqiId = " + aqiId +
        ", gridWatcherNumber = " + gridWatcherNumber +
        ", address = " + address +
        ", recordTime = " + recordTime +
        ", pm2d5 = " + pm2d5 +
        ", pm10 = " + pm10 +
        ", so2 = " + so2 +
        ", no2 = " + no2 +
        ", o3 = " + o3 +
        "}";
    }
}
