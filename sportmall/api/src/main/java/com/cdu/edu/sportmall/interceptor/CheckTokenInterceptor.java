package com.cdu.edu.sportmall.interceptor;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.cdu.edu.sportmall.vo.ResStatus;
import com.cdu.edu.sportmall.vo.ResultVo;
import io.jsonwebtoken.*;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Component
public class CheckTokenInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String method = request.getMethod();
        if("OPTIONS".equalsIgnoreCase(method)){
            return true;
        }
        String token = request.getHeader("token");
        if(token == null){
            ResultVo resultVo = new ResultVo(ResStatus.LOGIN_FAIL_NOT, "请先登录！", null);
            doResponse(response,resultVo);
        }else{
            try {
                JwtParser parser = Jwts.parser();
                parser.setSigningKey("6666"); //解析token的SigningKey必须和生成token时设置密码一致
                //如果token正确（密码正确，有效期内）则正常执行，否则抛出异常
                Jws<Claims> claimsJws = parser.parseClaimsJws(token);
                return true;
            }catch (ExpiredJwtException e){
                ResultVo resultVO = new ResultVo(ResStatus.LOGIN_FAIL_OVERDUE, "登录过期，请重新登录！", null);
                doResponse(response,resultVO);
            }catch (UnsupportedJwtException e){
                ResultVo resultVO = new ResultVo(ResStatus.LOGIN_FAIL_NOT, "Token不合法，请自重！", null);
                doResponse(response,resultVO);
            }catch (Exception e){
                ResultVo resultVO = new ResultVo(ResStatus.LOGIN_FAIL_NOT, "请先登录！", null);
                doResponse(response,resultVO);
            }
        }
        return false;
    }

    private void doResponse(HttpServletResponse response,ResultVo resultVo) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String s = new ObjectMapper().writeValueAsString(resultVo);
        out.print(s);
        out.flush();
        out.close();
    }

}
