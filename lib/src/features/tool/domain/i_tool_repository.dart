import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';


/// TODO to be implemented:

abstract class IToolRepository {
  Future<List<ToolModel>> fetchAllByUser(UserModel user);
  Future<List<ToolModel>> fetchAll();
  Future<ToolModel> addTool(ToolModel tool);
  Future<ToolModel> deleteTool(int id);
  Future<ToolModel> getToolById(ToolModel tool, int id);
  Future<ToolModel> updateTool(ToolModel tool, int id);

  //watch/read tools by search filters

}
