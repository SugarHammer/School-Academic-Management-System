package com.nsapi.niceschoolapi.entity;


import java.io.Serializable;
import java.util.Date;

/**
 * 招生表
 */

public class NewsinfoDB implements Serializable {

  private Integer nid; //招生编号
  private String ntitle; //招生标题
  private String ncontent; //招生内容
  private String nauthor; //招生编辑人
  private Date ntime; //发布时间
  private String nimg; //招生标题图

  public Integer getNid() {
    return nid;
  }

  public void setNid(Integer nid) {
    this.nid = nid;
  }

  public String getNtitle() {
    return ntitle;
  }

  public void setNtitle(String ntitle) {
    this.ntitle = ntitle;
  }

  public String getNcontent() {
    return ncontent;
  }

  public void setNcontent(String ncontent) {
    this.ncontent = ncontent;
  }

  public String getNauthor() {
    return nauthor;
  }

  public void setNauthor(String nauthor) {
    this.nauthor = nauthor;
  }

  public Date getNtime() {
    return ntime;
  }

  public void setNtime(Date ntime) {
    this.ntime = ntime;
  }

  public String getNimg() {
    return nimg;
  }

  public void setNimg(String nimg) {
    this.nimg = nimg;
  }
}
