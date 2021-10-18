package com.example.dreampicturespring.vo;

import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Paintingtbl;
import lombok.Data;

@Data
public class NoticeVO {
    private String content;
    private String avatarimg;
    private String paintingmimg;


    public NoticeVO(){ }
    public NoticeVO(String content, String avatarimg, String paintingmimg){
        this.content = content;
        this.avatarimg = avatarimg;
        this.paintingmimg = paintingmimg;
    }


}
