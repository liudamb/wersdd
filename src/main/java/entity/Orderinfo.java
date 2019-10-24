package entity;

import java.util.Date;

public class Orderinfo {
    private Integer oId;

    private Integer userid;

    private Integer status;

    private String ordertime;

    private String pid;

    public Integer getoId() {
        return oId;
    }

    public void setoId(Integer oId) {
        this.oId = oId;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    @Override
    public String toString() {
        return "Orderinfo{" +
                "oId=" + oId +
                ", userid=" + userid +
                ", status=" + status +
                ", ordertime='" + ordertime + '\'' +
                ", pid='" + pid + '\'' +
                '}';
    }
}