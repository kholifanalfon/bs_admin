part of datasource;

class TypeDataSource extends BsDatatableSource {

  ValueChanged<int> onEditListener = (typeid) {};
  ValueChanged<int> onDeleteListener = (typeid) {};

  static List<BsDataColumn> columns = <BsDataColumn>[
    BsDataColumn(label: Text(DBText.tableCellNo), width: 100.0, searchable: false, orderable: false),
    BsDataColumn(label: Text(TypeText.formCode), columnName: TypeText.tableCode),
    BsDataColumn(label: Text(DBText.formName), columnName: TypeText.tableName),
    BsDataColumn(label: Text(TypeText.formParent), columnName: TypeText.tableParentId),
    BsDataColumn(label: Text(DBText.tableCellAction), width: 200.0, searchable: false, orderable: false),
  ];

  List<TypeModel> get types => List<TypeModel>
      .from(response.data.map((e) => TypeModel.fromJson(e)).toList());

  @override
  BsDataRow getRow(int index) {
    TypeModel type = types[index];
    return BsDataRow(
        index: index,
        cells: <BsDataCell>[
          BsDataCell(Text('${controller.start + index + 1}')),
          BsDataCell(SelectableText('${notNull(type.typecd)}')),
          BsDataCell(SelectableText('${notNull(type.typenm)}')),
          BsDataCell(SelectableText('${notNull(type.parent.typenm)}')),
          BsDataCell(Row(children: [
            BsButton(
              margin: EdgeInsets.only(right: 5.0),
              prefixIcon: DBIcon.buttonEdit,
              size: BsButtonSize.btnIconSm,
              style: BsButtonStyle.primary,
              onPressed: () => onEditListener(type.id),
            ),
            BsButton(
              prefixIcon: DBIcon.buttonDelete,
              size: BsButtonSize.btnIconSm,
              style: BsButtonStyle.danger,
              onPressed: () => onDeleteListener(type.id),
            ),
          ]))
        ]
    );
  }

}