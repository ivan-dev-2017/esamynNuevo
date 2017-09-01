import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EvaluacionlistComponent } from './evaluacionlist.component';

describe('EvaluacionlistComponent', () => {
  let component: EvaluacionlistComponent;
  let fixture: ComponentFixture<EvaluacionlistComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EvaluacionlistComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EvaluacionlistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
