   M S B A M L   `   `   `  ����F  BFloorMaster, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:FloorMaster.Views.WindowsFloorMaster.Views.Windows  5   	   +    %FloorMaster.Views.Windows.SalesWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   9local'clr-namespace:FloorMaster.Views.Windows     5   	   $��20(�5   	   $��Segoe UI)�5	   	     � Title$  Продажи��5
   	   $	��600��6   $
��1200��6&   .��5      �  � RowDefinitions 5   
   �� 5      $	��100 �6   �� 5      $��* �6   �� 5      $��70 �6   .+�5   
   �� .��5      �� .+�5      �� -   5        $��Filter��5      $��150 10q�5      	� 5      -   5         	�Name$ 	ByProduct��5       	� 	GroupName$ 
FilterType��61   $��По продукту��5      $��Center=�64   	� 5      -   5        $��	ByPartner��5      $ 
FilterType��6/   $��По партнёру��5      $��Center=�64   �� 5      -   5         ��Name$ ApplyButton��5      $��Применить��5      $��200 10q�5      5      �� 5      -   5        $ 
DenyButton��5      $��Очистить��5      $��200 10q�5       5!      5"      5#      &   System.Windows.Controls.DataGrid  5%   
   -   5        $��SaleDataGrid��5%         AutoGenerateColumns .     
IsReadOnly . $��1��5&   %   ���#f4e8d3   Columns 5(      0  *System.Windows.Controls.DataGridTextColumn  5)      ,  &System.Windows.Controls.DataGridColumn   Header$	 №��6%   	   Width5  /System.Windows.Controls.DataGridLengthConverter$
	 Auto 6G   1  +System.Windows.Controls.DataGridBoundColumn
   Binding
 60   �� *Id+6G     5*      $ Продукт��6%   $	 4* 6W   
 66   �� *Product.Name+6W     5+      $ Партнёр��6%   $	 2* 6_   
 66   �� *Partner.Company.Name+6_     5,      $ 
Сумма��6%   $	 * 6O   
 64   �� *Amount+6O   5.      �� 50   
   -   5        $��
BackButton��50      $��Center=�51      $��Center=�52      $��2��53      $��
Назад��54      $
��50 5q�55      56      58      59      