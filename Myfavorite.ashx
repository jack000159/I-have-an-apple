<%@ WebHandler Language="C#" Class="Myfavorite" %>

using System;
using System.Web;

public class Myfavorite : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        if (context.Request.Cookies["myFavorite"] == null)
        {
            //
            context.Response.Redirect("Default.aspx");
        }
        else
        {

            string tid = context.Request.Cookies["myFavorite"].Value;
            string url = string.Format("phone.aspx?id={0}",tid);
            context.Response.Redirect(url);

        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}