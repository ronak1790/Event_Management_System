<%@ Page Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="bookevent.aspx.cs"
    Inherits="bookevent" Title="Event Management System" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" src="Calender/Calendar_new.js"></script>

    <link href="Calender/stylecal.css" type="text/css" rel="stylesheet" />

    <script language="javascript" src="Calender/calendar-en.js"></script>

    <script language="javascript" src="Calender/calendar.js"></script>

    <h2 class="about">
        Register Event..!!
    </h2>
    <div class="contact_areas">
        <div class="contactMain">
            <asp:Panel ID="pnlCategory" runat="server">
                <table id="Table5">
                    <%-- <tr>
                        <td colspan="2">
                            <asp:ValidationSummary ID="vs" runat="server"  />
                        </td>
                    </tr>--%>
                    <tr>
                        <td colspan="2">
                            <asp:ValidationSummary ID="vs" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDivMsg" runat="server" ForeColor="Red" EnableViewState="false"> </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label ID="Label2" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            City:
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlcity" runat="server" CssClass="dropdownEffect">
                            </asp:DropDownList>
                        </td>
                        <tr>
                            <td align="right">
                                Area:
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtarea" runat="server" CssClass="textboxEffect"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Venue:
                            </td>
                            <td align="left">
                                <asp:TextBox ID="venue" runat="server" CssClass="textboxEffect"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="venue"
                                    Display="Dynamic" EnableViewState="False" ErrorMessage="Enter Date of event"
                                    SetFocusOnError="True" Text="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top">
                                Start Date
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtstartdate" runat="server" Text='<%# Bind("NDate") %>'></asp:TextBox>
                                &nbsp;
                                <asp:Image ID="imgstartdate" runat="server" align="absMiddle" AlternateText="Click Here To Open Calendar"
                                    ImageUrl="~/Calender/btn_calendar.gif" onmouseover="javascript:this.style.cursor='hand';"
                                    vspace="1" />
                                <asp:Label ID="lblFormatDateFrom" runat="server" CssClass="small" Text="[mm/dd/yyyy]"> </asp:Label>
                                <%--<asp:RequiredFieldValidator ID="rfvtxtDateFrom" runat="server" ControlToValidate="txtstartdate"
                                    ErrorMessage="Date is a required field" Text="*"></asp:RequiredFieldValidator>--%>
                                <asp:CompareValidator ID="cvtxtDateFrom" runat="server" ControlToValidate="txtstartdate"
                                    ErrorMessage="Enter Valid Date From" Operator="DataTypeCheck" Text="*" Type="Date">
                                </asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top">
                                End Date
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtenddate" runat="server" Text='<%# Bind("NDate") %>'></asp:TextBox>
                                &nbsp;
                                <asp:Image ID="imgenddate" runat="server" align="absMiddle" AlternateText="Click Here To Open Calendar"
                                    ImageUrl="~/Calender/btn_calendar.gif" onmouseover="javascript:this.style.cursor='hand';"
                                    vspace="1" />
                                <asp:Label ID="Label1" runat="server" CssClass="small" Text="[mm/dd/yyyy]">
                               </asp:Label>
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtenddate"
                                    ErrorMessage="Date is a required field" Text="*"></asp:RequiredFieldValidator>--%>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtenddate"
                                    ErrorMessage="Enter Valid Date From" Operator="DataTypeCheck" Text="*" Type="Date">
                                </asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Guest Aspected:
                            </td>
                            <td align="left">
                                <asp:TextBox ID="guest" runat="server" CssClass="textboxEffect"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="guest"
                                    Display="Dynamic" EnableViewState="False" ErrorMessage="Enter Date of event"
                                    SetFocusOnError="True" Text="*"></asp:RequiredFieldValidator>
                            </td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="guest"
                                ErrorMessage="numeric" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </tr>
                        <tr>
                            <td align="right">
                                Time of event
                            </td>
                            <td align="left">
                                <asp:TextBox ID="toe" runat="server" CssClass="textboxEffect"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="toe"
                                    Display="Dynamic" EnableViewState="False" ErrorMessage="Enter Date of event"
                                    SetFocusOnError="True" Text="*"></asp:RequiredFieldValidator>
                            </td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="toe"
                                ErrorMessage="numeric" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Button ID="btnDivAdd" runat="server" CssClass="subbtn" EnableViewState="False"
                                    Text="Submit" onclick="btnDivAdd_Click" />
                                <asp:Button ID="Button2" runat="server" CausesValidation="false" CssClass="subbtn"
                                    EnableViewState="False" Text="Cancel" />
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
