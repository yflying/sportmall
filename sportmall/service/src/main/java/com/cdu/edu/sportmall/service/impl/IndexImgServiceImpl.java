package com.cdu.edu.sportmall.service.impl;


import com.cdu.edu.sportmall.dao.IndexImgMapper;
import com.cdu.edu.sportmall.entity.IndexImg;
import com.cdu.edu.sportmall.service.IndexImgService;
import com.cdu.edu.sportmall.vo.ResStatus;
import com.cdu.edu.sportmall.vo.ResultVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IndexImgServiceImpl implements IndexImgService {

    @Autowired
    private IndexImgMapper indexImgMapper;


    @Override
    public ResultVo listIndexImg() {

        List<IndexImg> indexImgs = indexImgMapper.selectIndexImg();
        if (indexImgs.size() == 0){

            return new ResultVo(ResStatus.NO,"fail",null);
        }else {
            return new ResultVo(ResStatus.OK,"success",indexImgs);
        }

    }
}
