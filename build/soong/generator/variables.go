package generator

import (
	"fmt"

	"android/soong/android"
)

func nadExpandVariables(ctx android.ModuleContext, in string) string {
	nadVars := ctx.Config().VendorConfig("nadVarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if nadVars.IsSet(name) {
			return nadVars.String(name), nil
		}
		// This variable is not for us, restore what the original
		// variable string will have looked like for an Expand
		// that comes later.
		return fmt.Sprintf("$(%s)", name), nil
	})

	if err != nil {
		ctx.PropertyErrorf("%s: %s", in, err.Error())
		return ""
	}

	return out
}
