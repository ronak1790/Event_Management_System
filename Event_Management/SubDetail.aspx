<%@ Page Title="Event Management" Language="C#" MasterPageFile="~/Client.master"
    AutoEventWireup="true" CodeFile="SubDetail.aspx.cs" Inherits="SubDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" border="0">
        <tr>
            <td>
                <asp:DataList ID="dl" runat="server" DataKeyField="subcat_id" RepeatColumns="1"
                    RepeatDirection="Vertical">
                    <ItemTemplate>
                        <h2 class="about">
                            <%# Eval("subcat_name") %>
                        </h2>
                        <p>
                            <asp:Image CssClass="slogan" runat="server" ID="img" ImageUrl='<%# Eval("subcat_Photos","~/Gallery/{0}")%>' />
                        </p>
                        <p align="justify" class="righttxt">
                            <%# Eval("subcat_Description") %>
                        </p>
                        </td> </tr>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td>
                            <h2 class="about">
                                Packages
                            </h2>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DataList ID="dlpackage" runat="server" Width="100%" DataKeyField="package_id"
                                RepeatColumns="4" RepeatDirection="Vertical">
                                <ItemTemplate>
                                    <table border="1" width="100%" cellpadding="5" cellspacing="5">
                                        <tr>
                                            <td align="center" width="100%">
                                                <a href="subpackage.aspx?id= <%# Eval("package_id") %>">
                                                    <%# Eval("package_name") %></a>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
