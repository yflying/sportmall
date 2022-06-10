package com.cdu.edu.sportmall.service;

import com.cdu.edu.sportmall.entity.ProductComments;
import com.cdu.edu.sportmall.vo.ResultVo;

public interface ProductCommentsService {

    public ResultVo ListCommentsByProductId(String productId,int pageNum,int limit);

    public ResultVo getCommentsCountByProductId(String productId);

    public ResultVo insertComments(String isAnonymous ,String commType,String commContent,String orderId,Integer userId);

    public ResultVo getUserComments(String userId,int pageNum,int limit);

    public ResultVo deleteUserComments(String commId);

    public ResultVo listAllComments(String keyword,int pageNum,int limit);

    public ResultVo replyComments(ProductComments productComments);
}
