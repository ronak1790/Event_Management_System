<%@ Page Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="adminphotoupload.aspx.cs"
    Inherits="adminuploadphoto" Title="Admin Photo Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="about">
        Upload Photo...!!!</h2>
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
                             Category:
                        </td>
                        <td>
                            <asp:DropDownList ID="drpcategory" runat="server" CssClass="dropdownEffect" 
                                onselectedindexchanged="drpcategory_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Sub Category:
                        </td>
                        <td>
                            <asp:DropDownList ID="drpsubcategory" runat="server" CssClass="dropdownEffect">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvsubcategory" runat="server" ControlToValidate="drpsubcategory"
                                ErrorMessage="Enter Category" Text="Required !" Display="Dynamic" EnableViewState="False"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="right">
                            <asp:Label ID="lblPath0" runat="server" Text="Image :"></asp:Label>
                        </td>
                        <td valign="top" align="left">
                            <asp:FileUpload ID="filUpload" runat="server" CssClass="textBox" Width="200px" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="right">
                            <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
                        </td>
                        <td valign="top" align="left">
                            <asp:TextBox ID="txtMemo" runat="server" Height="100px" TextMode="MultiLine" Width="200px"></asp:TextBox><br />
                            Description will be displayed on hover of image
                        </td>
                    </tr>
                    <tr>
                    <td valign="top" align="right">
                            <asp:Label ID="Label1" runat="server" Text="IsBanner :"></asp:Label>
                        </td>
                        <td valign="top" align="left">
                            <asp:CheckBox runat="server" ID="chk" Text=""  />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" colspan="2" align="center">
                            <asp:Button ID="btnAddToCategory" runat="server" Text="Upload" CssClass="subbtn"
                                OnClick="btnAddToCategory_Click" /><br />
                            <asp:Label ID="lblUploadMessage" runat="server" ForeColor="Red" Text="File uploaded successfully..."
                                Width="200px" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td id="tdNote" runat="server" colspan="2" nowrap="nowrap" align="left">
                            <fieldset class="small fieldSet panel">
                                <legend><b>Note:</b></legend>&nbsp; - files up to 512 Kb can be uploaded
                                <br />
                                &nbsp; - The file must have an extension of JPG or JPG
                                <br />
                                <br />
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
</asp:Content>
