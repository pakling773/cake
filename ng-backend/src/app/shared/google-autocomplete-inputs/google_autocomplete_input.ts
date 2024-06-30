import {
  Component,
  ViewChild,
  EventEmitter,
  Output,
  OnInit,
  AfterViewInit,
  Input,
} from '@angular/core';
import { FormsModule } from '@angular/forms';
declare var google: any;
@Component({
  selector: 'AutocompleteComponent',
  standalone: true,
  imports: [FormsModule],
  styleUrl: './google-autocomplete.component.scss',
  template: `
    <input
      class="form-control"
      type="text"
      [(ngModel)]="autocompleteInput"
      #addresstext
    />
  `,
})
export class AutocompleteComponent implements OnInit, AfterViewInit {
  @Input() adressType!: string;

  @Output() setAddress: EventEmitter<any> = new EventEmitter();
  @ViewChild('addresstext') addresstext: any;

  @Input('value') autocompleteInput!: string;
  queryWait!: boolean;

  constructor() {}

  ngOnInit() {}

  ngAfterViewInit() {
    this.getPlaceAutocomplete();
  }

  private getPlaceAutocomplete() {
    const autocomplete = new google.maps.places.Autocomplete(
      this.addresstext.nativeElement,
      {
        componentRestrictions: { country: 'HK' },
        // types: [this.adressType], // 'establishment' / 'address' / 'geocode'
      }
    );
    google.maps.event.addListener(autocomplete, 'place_changed', () => {
      const place = autocomplete.getPlace();
      this.invokeEvent(place);
    });
  }

  invokeEvent(place: Object) {
    this.setAddress.emit(place);
  }
}
