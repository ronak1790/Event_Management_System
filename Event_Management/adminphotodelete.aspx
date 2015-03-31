<%@ Page Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adminphotodelete.aspx.cs"
    Inherits="admindeletephoto" Title="Admin Photo Delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="about">
        Delete Photo..!!
    </h2>
    <div class="contact_areas">
        <div class="contactMain">
            <asp:Panel ID="pnlCategory" runat="server">
                <table width="100%" align="center">
                    <tr>
                        <td align="left" valign="top">
                            <asp:Panel ID="pnlView" runat="server" Width="100%" Visible="true">
                                <table cellpadding="2" width="100%">
                                    <tr>
                                        <td align="left" valign="top" nowrap="nowrap" colspan="2">
                                            <table width="100%" border="0">
                                                <tr>
                                                    <td nowrap="nowrap" valign="top">
                                                        <table width="1%" border="0" cellspacing="1" cellpadding="1">
<%--                                                            <tr>
                                                                <td id="tdNote" runat="server" nowrap="nowrap" align="left">
                                                                    <fieldset class="small fieldSet panel">
                                                                        <legend><b>Note:</b></legend>&nbsp; - Click the
                                                                        <img alt="" src="images/del.gif" width="16" height="16" hspace="1" vspace="1" border="0" />
                                                                        button to <b>Delete</b>&nbsp; Entry&nbsp;
                                                                        <br />
                                                                        &nbsp; - Click on the column header to sort
                                                                        <br />
                                                                        <br />
                                                                    </fieldset>
                                                                </td>
                                                            </tr>--%>
                                                        </table>
                                                    </td>
                                                    <td valign="top" align="right">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:Label ID="lblError" runat="server" Text="" CssClass="Error" EnableViewState="false"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td nowrap="nowrap" align="center">
                                            <asp:Label ID="lblMsg" runat="server" EnableViewState="false" CssClass="note thinHead"
                                                Visible="false" Text="Operation completed successfully"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr class="note">
                                        <td align="center">
                                            <asp:Label ID="lblCount" runat="server" CssClass="AckMsg smallheader" Text="see property TextTemplate in aspx"
                                                TextTemplate="Total no of records : <b>{0}</b>" Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <input type="hidden" id="__hdnchksel" name="__hdnchksel" />
                                            <asp:GridView ID="gv" runat="server" OnRowCancelingEdit="gv_RowEvent" HeaderStyle-ForeColor="Black"
                                                DataKeyNames="PKPhotoId" OnRowCommand="gv_RowEvent" OnRowDeleting="gv_RowEvent"
                                                AutoGenerateColumns="False" AllowPaging="True" EmptyDataText="<center class='note'>No records found</center>"
                                                PagerStyle-CssClass="mainpagerfont" PageSize="3" onpageindexchanging="gv_PageIndexChanging">
                                                <Columns>
                                                    <asp:BoundField DataField="Id" Visible="False" />
                                                    <asp:CommandField ShowDeleteButton="True">
                                                        <ItemStyle Width="1%" />
                                                    </asp:CommandField>
                                                    <asp:BoundField HeaderText="PhotoName" DataField="Description" />
                                                    <asp:TemplateField HeaderText="Image">
                                                        <ItemTemplate>
                                                            <asp:Image runat="server" ID="idImg" ImageUrl='<%# Eval("TFilename", "~/Gallery/{0}")%>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="Thumbnail" DataField="TFileName" />
                                                    <asp:BoundField HeaderText="Actual Image" DataField="IFileName" />
                                                </Columns>
                                                <HeaderStyle ForeColor="Black" />
                                                <PagerStyle CssClass="mainpagerfont" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
</asp:Content>
