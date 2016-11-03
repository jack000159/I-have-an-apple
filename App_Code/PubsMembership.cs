using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Membership 的摘要描述
/// </summary>
/// Membership 衝突了 改名子 

public class PubsMembership
{
    public static bool CreateUser(string username, string password, out string errMessage)
    {
        bool result = false;
        errMessage = string.Empty;

        Member member = new Member();
        member.Username = username;
        member.HashPassword = GenHash(password);

        try {//加入會員
            productEntities1 db = new productEntities1();
            db.Members.Add(member);
            db.SaveChanges(); //SaveChanges才會正式寫入資料庫
            result = true;

        } 
        catch (Exception ex)
        {
            errMessage = ex.Message;
        }
        return result;
        
    }
    static string GenHash(string password)
    {
        string salt = BCrypt.Net.BCrypt.GenerateSalt(12);
        string hash = BCrypt.Net.BCrypt.HashPassword(password, salt);
        return hash;
    }
    public static bool VerifyUser(string username,string password)
    {
        //取得資料庫中使用者對應的HashPass
        string hashDb="";
        productEntities1 db = new productEntities1();
        Member user = db.Members.Find(username);
        if (user == null) //會員不存在
        {
            return false;
        }
        else
        {
            hashDb = user.HashPassword;
        }

        //比對
        return BCrypt.Net.BCrypt.Verify(password, hashDb);
        
    }
}
