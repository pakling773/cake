import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AutocompleteComponent } from './google-autocomplete-inputs/google_autocomplete_input';

@NgModule({
  declarations: [],
  exports: [AutocompleteComponent],
  imports: [CommonModule, AutocompleteComponent],
})
export class SharedModule {}
