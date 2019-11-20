
package com.spring.domain;

import lombok.Data;

@Data
public class ApplyBookVO {
private String bookname;
private String writer;
private String publisher;
private String publish_year;
private String publish_year_yy;
private String publish_year_mm;
private String genre;
private int price;
private long isbn;
private String userid;
private int applystatus;
}
