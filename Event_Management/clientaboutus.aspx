<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true"
    CodeFile="clientaboutus.aspx.cs" Inherits="clientaboutus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="about">
        Contact Us..!!
    </h2>
    <div class="contact_areas">
        <div class="contactMain">
            <asp:DataList ID="dl" runat="server" DataKeyField="contact_id" RepeatColumns="1"
                RepeatDirection="Vertical">
                <ItemTemplate>
                    <table cellpadding="2" cellspacing="2" border="0" align="left" style="padding-left: 3px;
                        padding-right: 3px;">
                       <%-- <tr>
                            <td align="center" >
                                
                                    <h2>
                                        <%# Eval("contact_name") %>
                                    </h2>
                                
                            </td>
                        </tr>
                       --%> 
                        <tr>
                            <td>
                            <br />
                        <br />
                                Address:
                                <asp:Label CssClass="brownboldLabel" Font-Size="Larger" runat="server" Text='<%# Eval("contact_address") %>'
                                    ID="lbl"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="text-align: justify; font-weight: normal;">
                                <p>
                                    Email us on:
                                    <asp:Label runat="server" Font-Size="Larger" Text='<%# Eval("contact_email") %>'
                                        ID="Label2"></asp:Label></p>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="text-align: justify; font-weight: normal;">
                                <p>
                                    Contact us on:
                                    <asp:Label runat="server" Font-Size="Larger" Text='<%# Eval("contact_contactno") %>'
                                        ID="Label3"></asp:Label></p>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
