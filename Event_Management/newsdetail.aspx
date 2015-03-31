<%@ Page Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="newsdetail.aspx.cs" Inherits="newsdetail" Title="Event Management System" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h2 class="about">News detail </h2>
 <asp:DataList ID="dl" runat="server" DataKeyField="news_id" RepeatColumns="1" RepeatDirection="Vertical">
                                            <ItemTemplate>
                                                <table cellpadding="2" cellspacing="2" width="100%" border="0" align="center" style="padding-left:3px;padding-right:3px;"  >
                                                    <tr>
                                                        <td align="left">
                                                          <i><asp:Label ID="Label1" runat="server" ForeColor="#33ccff" Text='<%# Eval("NewsDate") %>' ></asp:Label></i>                                                     
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                    <td>
                                                    <asp:Label  CssClass="brownboldLabel"  runat="server" Text='<%# Eval("news_title") %>' ID="lbl"></asp:Label>
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" style="text-align:justify;font-weight:normal;" >
                                                           <p> <asp:Label runat="server" Text='<%# Eval("Description") %>' ID="Label2"></asp:Label></p>
                                                        </td>
                                                    </tr>
                                                    
                                                </table>
                                            </ItemTemplate>
                                        </asp:DataList>
 


</asp:Content>

