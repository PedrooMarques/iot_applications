/**
 * 
 */
package handlers.warnings;

import java.util.ArrayList;

/**
 * @author G16
 *
 */
public class Warnings {
	
	private ArrayList<Warning> warnings;
	
	public Warnings() {
		this.warnings = new ArrayList<Warning>();
	}

	public ArrayList<Warning> getWarnings() {
		return this.warnings;
	}

	public Warning addWarning(Warning warning) {
		this.warnings.add(warning);
		return warning;
	}

	public Warning removeWarning(Warning warning) {
		this.warnings.remove(warning);
		return warning;
	}

}