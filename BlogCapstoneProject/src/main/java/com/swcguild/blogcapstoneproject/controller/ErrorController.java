
import java.text.MessageFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author apprentice
 */
public class ErrorController {
    
    public String customeError(HttpServletRequest req, 
            HttpServletResponse resp, Model model){
        
        Integer statusCode =
                (Integer) req.getAttribute("javax.servlet.error.status_code");
        HttpStatus httpStatus = HttpStatus.valueOf(statusCode);
        String exceptionMessage =  httpStatus.getReasonPhrase();
        String requestUri = (String) req.getAttribute("javax.servlet.error.request_uri");
        if(requestUri == null) {
            requestUri = "known";
        }
        
        String message = MessageFormat.format("{0} returned for {1}: {2}",
                statusCode, requestUri,exceptionMessage);
        
        model.addAttribute("errorMessage", message);
        
        return "customError";
    }
}
