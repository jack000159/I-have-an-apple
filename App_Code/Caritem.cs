using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Caritem 的摘要描述
/// </summary>
public class Caritem
{
    //取得產品採購資訊(編號,售價,數量,小計)
    public string Title_Id { get; set; }//編號
    public decimal Price { get; set; }//售價
    public int Quanty { get; set; } //數量
    public string name { get; set; }
    public decimal SubTotal {
        get
        {
            return this.Price * this.Quanty;
        }
    }//小計
}