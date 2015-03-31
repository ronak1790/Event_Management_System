<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Adminlogin.aspx.cs" Inherits="Adminlogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EVENT MANAGEMENT SYSTEM </title>
</head>
<body style="background-color: white">
    <form id="form1" runat="server">
    <br>
    <br>
    <br>
    <table align="center">
        <tr>
            <td colspan="3" align="center">
                <img src="images/imagest.jpg" alt="cg"  />
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Label ID="adminarea" runat="server" Text="This is a restricted area and strictly for administration use only"
                    ForeColor="Red" Font-Size="15px" Font-Bold="true"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Label ID="Label2" runat="server" Text="Admin Login" ForeColor="Green" Font-Size="XX-Large"
                    Font-Bold="true"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="uname" runat="server" Text="User Id:" ForeColor="Green" Font-Bold="true"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtuname" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Enter user name"
                    ControlToValidate="txtuname"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="pass" runat="server" Text="Password:" ForeColor="Green" Font-Bold="true"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtpwd" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="Enter password"
                    ControlToValidate="txtpwd"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:Button ID="btnlogin" runat="server" Text="Login" Font-Bold="true" ForeColor="Green"
                    OnClick="btnlogin_Click" />
                <asp:Button ID="btnreset" runat="server" Text="Reset" Font-Bold="true" CausesValidation="false"
                    ForeColor="Green" OnClick="btnreset_Click" />
            </td>
        </tr>
    </table>
    </form>
    .</body>
</html>
