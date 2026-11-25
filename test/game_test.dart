import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_sanat_ve_edebiyat/oyun_sanat_ve_edebiyat.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(sanatVeEdebiyatConfig.title.length, 33);
    expect(sanatVeEdebiyatConfig.tagline.length, 33);
    for (final s in sanatVeEdebiyatConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(sanatVeEdebiyatConfig.gameId, sanatVeEdebiyatId);
    expect(sanatVeEdebiyatRules.gameId, sanatVeEdebiyatId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(sanatVeEdebiyatRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: sanatVeEdebiyatId, optionalMechanics: sanatVeEdebiyatRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(sanatVeEdebiyatRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
