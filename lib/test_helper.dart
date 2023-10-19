
class TestHelper {

  TestHelper._();

  static final List<String> _list = List.generate(1000000, (index) => 'index_$index');

  static void test() {
    print('test ${_list.length}');
  }

}