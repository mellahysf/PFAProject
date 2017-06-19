
package ma.ensao.servlets;

import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ma.ensao.entity.User;
import ma.ensao.hibernateDAO.LoginService;


public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        String userId = request.getParameter("userId");        
        String password = request.getParameter("password");
        User usr = new User();
        LoginService loginService = new LoginService();
        usr=loginService.getUserByLoginPassword(userId, password);
        boolean result = loginService.authenticate(userId, password);
        User user = loginService.getUserByUserId(userId);
        if(user!=null){
      	   String status=usr.getStatus();
             if(result == true && status.equals("admin")){
                 request.getSession().setAttribute("user", user);            
                 response.sendRedirect("/PFA2017/Admin");
             }
             else if(result == true && status.equals("etudiant")){
                 request.getSession().setAttribute("user", user);            
                 response.sendRedirect("/PFA2017/Front");
             }
             else if(result == true && status.equals("prof")){
                 request.getSession().setAttribute("user", user);            
                 response.sendRedirect("/PFA2017/Prof");
             }
             else{
                 response.sendRedirect("login.jsp");
             }
         }
         else{
      	   request.setAttribute("error", "User Id and / or password is incorrect(s)");
             request.getRequestDispatcher("login.jsp").forward(request, response);
         }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
