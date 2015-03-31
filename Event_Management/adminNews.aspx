<%@ Page Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adminNews.aspx.cs"
    Inherits="adminNews" Title="Admin News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 <script language="javascript" src="Calender/Calendar_new.js"></script>
<link href="Calender/stylecal.css" type="text/css" rel="stylesheet" />
    <script language="javascript" src="Calender/calendar-en.js"></script>

    <script language="javascript" src="Calender/calendar.js"></script>
    <h2 class="about">
        Manage News..!!
    </h2>
    <div class="contact_areas">
        <div class="contactMain">
            <asp:Panel ID="pnlCategory" runat="server">
                <table id="Table5">
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label ID="lblDivMsg" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            News Title
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtnewstitle" CssClass="textboxEffect" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvdiv" runat="server" ControlToValidate="txtnewstitle"
                                Text="Required !" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" valign="top">
                             Date 
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtNDate" runat="server"   Text='<%# Bind("NDate") %>'></asp:TextBox>&nbsp;
                            <asp:Image AlternateText="Click Here To Open Calendar" ImageUrl="~/Calender/btn_calendar.gif"
                                vspace="1" align="absMiddle" onmouseover="javascript:this.style.cursor='hand';"
                                runat="server" ID="imgDate" />
                            <asp:Label ID="lblFormatDateFrom" CssClass="small" runat="server" Text="[mm/dd/yyyy]"> </asp:Label>
                            <asp:RequiredFieldValidator ID="rfvtxtDateFrom" runat="server" ControlToValidate="txtNDate"
                                ErrorMessage="Date is a required field" Text="*"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvtxtDateFrom" runat="server" ControlToValidate="txtNDate"
                                Text="*" Operator="DataTypeCheck" Type="Date" ErrorMessage="Enter Valid Date From">
                            </asp:CompareValidator>
                        </td>
                    </tr>
                     <tr>
                        <td align="right" valign="top" >
                           Description
                        </td>
                        <td>
                            <asp:TextBox ID="txtnewsdesc" TextMode="MultiLine" Rows="3" Columns="50"    runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvorder" runat="server" Text="*" ControlToValidate="txtnewsdesc"
                                Display="Dynamic"  SetFocusOnError="True" EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                   
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button CssClass="subbtn" ID="Button3" runat="server" Text="Add / Edit" OnClick="btnDivAdd_Click"
                                EnableViewState="False" />&nbsp;
                            <asp:Button ID="Button4" runat="server" CssClass="subbtn" CausesValidation="false"
                                Text="Cancel" OnClick="btnDivCancel_Click" EnableViewState="False" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label runat="server" ID="lbltotal" ForeColor="Red" EnableViewState="false"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <%--<div id="Div7" style="overflow-x: auto; overflow-y: auto; width: 100%; height: 340px;"
                        class="thinBorder">--%>
                            <asp:GridView ID="gv1" runat="server" AllowPaging="true" PageSize="7" AutoGenerateColumns="False"
                                DataKeyNames="news_id" Width="80%" OnPageIndexChanging="gv1_PageIndexChanging">
                                <Columns>
                                    <asp:TemplateField HeaderText="News Title">
                                        <ItemTemplate>
                                            <asp:Label ID="lblnewstitle" runat="server" Text='<%#Eval("news_title") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Category Description">
                                        <ItemTemplate>
                                            <asp:Label ID="lblnewsdesc" runat="server" Text='<%#Eval("news_description") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="News Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblnewsdate" runat="server" Text='<%#Eval("news_date") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ibgvEdit" runat="server" CausesValidation="false" ImageUrl="images/edit.gif"
                                                OnClick="ibgvEdit_Click" />&nbsp;
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ibgvDel" runat="server" CausesValidation="false" ImageUrl="images/del.gif"
                                                OnClick="ibgvDel_Click" />&nbsp;
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    No Record Found.
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <%-- </div>--%>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
</asp:Content>
