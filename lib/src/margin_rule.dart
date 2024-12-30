enum MarginRule {
  marginM3,
  marginOptimal,
}

extension MarginRuleType on MarginRule? {
  bool isMarginM3() => this == MarginRule.marginM3;
  bool isMarginOptimal() => this == MarginRule.marginOptimal;
}
