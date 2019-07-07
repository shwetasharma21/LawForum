<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="position:relative;top:0px">
        <asp:Label ID="LblHomeMsgUserName" runat="server" Text="Welcome User" ForeColor="Green" Width="100%" style="text-align:center" /><br />
    </div>
    <div style="position:absolute;top:10px;right:10px">
        <asp:LinkButton ID="BtnLogout" runat="server" Text="Logout" onclick="BtnLogout_Click" />
    </div>
    <div style="position:relative;top:10" >
        <asp:Label ID="LblHomeMessage" runat="server" Text="Select one of the queries below to view content" /><br />
        <asp:DataList ID="ListPosts" runat="server" >
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton1" runat="server" <%#Eval("post_id")%> />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton2" runat="server" <%#Eval("post_title")%> />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    </form>
</body>
</html>
